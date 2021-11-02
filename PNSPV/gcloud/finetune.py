import numpy as np

import torch
import torchvision
from torchvision import transforms, models
from torchvision.datasets import ImageFolder
from torch.utils.data import DataLoader


model = models.resnet18(pretrained=True)
for param in model.parameters():
   param.requires_grad = False
model.fc = torch.nn.Linear(model.fc.in_features, 2)
model.cuda()

transform = transforms.Compose([
    transforms.Resize(256),
    transforms.CenterCrop(224),
    transforms.ToTensor(),
    transforms.Normalize(mean=[0.485, 0.456, 0.406], std=[0.229, 0.224, 0.225])
    ])


train_dataset = ImageFolder('dogscats/train', transform=transform)
val_dataset = ImageFolder('dogscats/valid', transform=transform)

train_loader = DataLoader(train_dataset, batch_size=32, shuffle=True)
val_loader = DataLoader(val_dataset, batch_size=32)


ce_loss = torch.nn.CrossEntropyLoss().cuda()
optimizer = torch.optim.Adam(model.fc.parameters(), lr=1e-3, weight_decay=0.0)

for e in range(3):
    train_losses = []
    val_losses = []

    model.train()
    for i, batch in enumerate(train_loader):
        x, y = batch[0].cuda(), batch[1].cuda()
        optimizer.zero_grad()
        out = model(x.cuda())
        loss = ce_loss(out, y)
        loss.backward()
        train_losses.append(loss.item())
        optimizer.step()
        if i % 20 == 0:
            print("Training loss at step {}: {}".format(i, loss.item()))

    model.eval()
    with torch.no_grad():
        correct = 0
        total = 0
        for i, batch in enumerate(val_loader):
            x, y = batch[0].cuda(), batch[1].cuda()

            out = model(x)
            loss = ce_loss(out, y)
            acc = torch.sum(torch.argmax(out, dim=-1) == y)
            correct += acc.item()
            total += len(batch[1])
            val_losses.append(loss.item())

    print("At epoch {} \t val acc: {} \t val loss: {} \t train loss: {}".format(e, correct/total, np.mean(val_losses), np.mean(train_losses)))


