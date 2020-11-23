import keras
from keras.preprocessing.image import ImageDataGenerator
from keras.models import Sequential
from keras.layers import Dense, GlobalAveragePooling2D

xception = keras.applications.xception.Xception(include_top = False)
for layer in xception.layers:
    layer.trainable = False

print(xception.summary())


datagen = ImageDataGenerator(horizontal_flip=True)

train_gen = datagen.flow_from_directory('dogscats/train', target_size=(299,299), batch_size=32)
val_gen = datagen.flow_from_directory('dogscats/valid', target_size=(299,299), batch_size=32)

model = Sequential()
model.add(xception)
model.add(GlobalAveragePooling2D())
model.add(Dense(2, activation='softmax'))

model.compile(loss='categorical_crossentropy', optimizer='adam', metrics=['accuracy'])

model.fit_generator(train_gen, validation_data=val_gen, epochs=20)