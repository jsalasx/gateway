from gateway.models import mensajesModel
from gateway.models import auxiliarModel
from gateway.serialization import Serializationclass
from gateway.serialization import SerializationclassAuxiliar
from gateway.serialization import SerializationclassTokens
from rest_framework.response import Response
from rest_framework import status
from rest_framework.decorators import api_view
from rest_framework.views import APIView
from django.shortcuts import render
from gateway.models import tokensModel


class mensajesTable(APIView):
    def get(self,request):
        mensajeObj = mensajesModel.objects.all()
        mensajeSerializeObj = Serializationclass(mensajeObj,many=True)
        return Response(mensajeSerializeObj.data)

class mensajesPorAuxiliar(APIView):
    def get_object(self,auxiliar):
        try:
             return mensajesModel.objects.get(auxiliar=auxiliar)
        except mensajesModel.DoesNotExist:
            return Response(status=status.HTTP_400_BAD_REQUEST)

    def get(self,request,auxiliar):
        mensajeObj = self.get_object(auxiliar)
        mensajeSerializeObj = Serializationclass(mensajeObj,many=True)
        return Response(mensajeSerializeObj.data)


    def put(self,request,auxiliar):
        mensajeObj = self.get_object(auxiliar)
        mensajeSerializeObj = Serializationclass(mensajeObj,data=request.data)
        if mensajeSerializeObj.is_valid():
            mensajeSerializeObj.save()
            return Response(mensajeSerializeObj.data,status=status.HTTP_201_CREATED)
        return Response(mensajeSerializeObj.errors,status=status.HTTP_400_BAD_REQUEST)



@api_view(['GET'])
def showMensajes(request):
    if request.method == 'GET':
        results=mensajesModel.objects.all()
        serialize=Serializationclass(results,many=True)
        return Response(serialize.data)

@api_view(['POST'])
def saveMensajes(request):
    if request.method== 'POST':
        saveserialize=Serializationclass(data=request.data)
        if saveserialize.is_valid():
            saveserialize.save()
            return Response(saveserialize.data,status=status.HTTP_201_CREATED)
            return Response(saveserialize.data,status=status.HTTP_400_BAD_REQUEST)

@api_view(['POST'])
def saveAuxiliar(request):
    if request.method== 'POST':
        saveserialize=SerializationclassAuxiliar(data=request.data)
        if saveserialize.is_valid():
            saveserialize.save()
            return Response(saveserialize.data,status=status.HTTP_201_CREATED)
            return Response(saveserialize.data,status=status.HTTP_400_BAD_REQUEST)


@api_view(['GET'])
def showAuxiliar(request):
    if request.method == 'GET':
        results=auxiliarModel.objects.all()
        serialize=SerializationclassAuxiliar(results,many=True)
        return Response(serialize.data)


@api_view(['GET','PUT']) 
def updateAuxiliar(request,pk=None):
    if request.method == 'GET':
        auxiliar = auxiliarModel.objects.filter(id=pk).first()
        serialize=SerializationclassAuxiliar(auxiliar)
        return Response(serialize.data)
    elif request.method == 'PUT':
        auxiliar = auxiliarModel.objects.filter(id=pk).first()
        serialize = SerializationclassAuxiliar(auxiliar,data=request.data)
        if serialize.is_valid():
            serialize.save()
            return Response(serialize.data)
        return Response(serialize.errors)


@api_view(['POST'])
def saveToken(request):
    if request.method== 'POST':
        saveserialize=SerializationclassTokens(data=request.data)
        if saveserialize.is_valid():
            saveserialize.save()
            return Response(saveserialize.data,status=status.HTTP_201_CREATED)
            return Response(saveserialize.data,status=status.HTTP_400_BAD_REQUEST)

@api_view(['GET'])
def showToken(request):
    if request.method == 'GET':
        results=tokensModel.objects.all()
        serialize=SerializationclassTokens(results,many=True)
        return Response(serialize.data)            