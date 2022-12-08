from rest_framework import serializers
from gateway.models import mensajesModel
from gateway.models import auxiliarModel
from gateway.models import tokensModel

class Serializationclass(serializers.ModelSerializer):
    class Meta:
        model= mensajesModel
        fields= '__all__'


class SerializationclassAuxiliar(serializers.ModelSerializer):
    class Meta:
        model= auxiliarModel
        fields= '__all__'

class SerializationclassTokens(serializers.ModelSerializer):
    class Meta:
        model= tokensModel
        fields= '__all__'

