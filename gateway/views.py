from gateway.models import mensajesModel
from gateway.models import auxiliarModel
from gateway.serialization import Serializationclass
from gateway.serialization import SerializationclassAuxiliar
from gateway.serialization import SerializationclassTokens
from gateway.serialization import SerializationclassTokenMensajes
from rest_framework.response import Response
from rest_framework import status
from rest_framework.decorators import api_view
from rest_framework.views import APIView
from django.shortcuts import render
from gateway.models import tokensModel
from gateway.models import tokenMensajes
from rest_framework.permissions import IsAuthenticated


class mensajesTable(APIView):

    def get(self, request):
        mensajeObj = mensajesModel.objects.all()
        mensajeSerializeObj = Serializationclass(mensajeObj, many=True)
        return Response(mensajeSerializeObj.data)


class mensajesPorAuxiliar(APIView):
    def get_object(self, auxiliar):
        try:
            return mensajesModel.objects.get(auxiliar=auxiliar)
        except mensajesModel.DoesNotExist:
            return Response(status=status.HTTP_400_BAD_REQUEST)

    def get(self, request, auxiliar):
        mensajeObj = self.get_object(auxiliar)
        mensajeSerializeObj = Serializationclass(mensajeObj, many=True)
        return Response(mensajeSerializeObj.data)

    def put(self, request, auxiliar):
        mensajeObj = self.get_object(auxiliar)
        mensajeSerializeObj = Serializationclass(mensajeObj, data=request.data)
        if mensajeSerializeObj.is_valid():
            mensajeSerializeObj.save()
            return Response(mensajeSerializeObj.data, status=status.HTTP_200_CREATED)
        return Response(mensajeSerializeObj.errors, status=status.HTTP_400_BAD_REQUEST)


@api_view(['GET'])
def showMensajes(request):
    if request.method == 'GET':
        results = mensajesModel.objects.all()
        serialize = Serializationclass(results, many=True)
        return Response(serialize.data)


@api_view(['GET'])
def showMensajesUltimos(request):
    if request.method == 'GET':
        results = mensajesModel.objects.all().order_by('-id')[0:10]
        serialize = Serializationclass(
            results, many=True)
        return Response(serialize.data)


@api_view(['POST'])
def showMensajesWithToken(request):
    if request.method == 'POST':

        tokenRequest = request.data["token"]
        tokenConsultado = tokensModel.objects.filter(
            token=tokenRequest).first()
        if (tokenConsultado != None):
            tokenMensajes_MensajesLeidos = tokenMensajes.objects.filter(
                token_id=tokenConsultado.id)
            mensajes_id = []
            for msjLeido in tokenMensajes_MensajesLeidos:
                mensajes_id.append(msjLeido.mensaje_id)

            results = mensajesModel.objects.exclude(id__in=mensajes_id)
            serialize = Serializationclass(results, many=True)
            return Response(serialize.data, status=status.HTTP_200_CREATED)
        else:
            return Response(request.data, status=status.HTTP_400_BAD_REQUEST)


@api_view(['POST'])
def showMensajesWithTokenMovil(request):
    if request.method == 'POST':

        tokenRequest = request.data["token"]
        tokenConsultado = tokensModel.objects.filter(
            token=tokenRequest).first()
        if (tokenConsultado != None):
            tokenMensajes_MensajesLeidos = tokenMensajes.objects.filter(
                token_id=tokenConsultado.id)
            mensajes_id = []
            for msjLeido in tokenMensajes_MensajesLeidos:
                mensajes_id.append(msjLeido.mensaje_id)

            results = mensajesModel.objects.exclude(
                id__in=mensajes_id).order_by('-id')
            serialize = Serializationclass(results, many=True)

            for checkMsj in results:
                tokenMensaje = tokenMensajes(
                    token_id=tokenConsultado.id, mensaje_id=checkMsj.id)
                tokenMensaje.save()

            return Response(serialize.data, status=status.HTTP_200_CREATED)
        else:
            return Response(request.data, status=status.HTTP_400_BAD_REQUEST)


@api_view(['POST'])
def AddMensajesLeidos(request):
    if request.method == 'POST':

        tokenRequest = request.data["token"]
        tokenConsultado = tokensModel.objects.filter(
            token=tokenRequest).first()
        if (tokenConsultado != None):
            tokenMensajes_MensajesLeidos = tokenMensajes.objects.filter(
                token_id=tokenConsultado.id)
            mensajes_id = []
            for msjLeido in tokenMensajes_MensajesLeidos:
                mensajes_id.append(msjLeido.mensaje_id)

            results = mensajesModel.objects.exclude(id__in=mensajes_id)
            for checkMsj in results:
                tokenMensaje = tokenMensajes(
                    token_id=tokenConsultado.id, mensaje_id=checkMsj.id)
                tokenMensaje.save()
            serialize = Serializationclass(results, many=True)
            return Response(serialize.data, status=status.HTTP_201_CREATED)
        else:
            return Response(request.data, status=status.HTTP_400_BAD_REQUEST)


class saveMensajes(APIView):
    permission_classes = [IsAuthenticated]

    def post(self, request):
        if request.method == 'POST':
            saveserialize = Serializationclass(data=request.data)
            if saveserialize.is_valid():
                saveserialize.save()
                return Response(saveserialize.data, status=status.HTTP_201_CREATED)
            return Response(saveserialize.data, status=status.HTTP_400_BAD_REQUEST)


@ api_view(['POST'])
def saveAuxiliar(request):
    if request.method == 'POST':
        saveserialize = SerializationclassAuxiliar(data=request.data)
        if saveserialize.is_valid():
            saveserialize.save()
            return Response(saveserialize.data, status=status.HTTP_201_CREATED)
            return Response(saveserialize.data, status=status.HTTP_400_BAD_REQUEST)


@ api_view(['GET'])
def showAuxiliar(request):
    if request.method == 'GET':
        results = auxiliarModel.objects.all()
        serialize = SerializationclassAuxiliar(results, many=True)
        return Response(serialize.data)


@ api_view(['GET', 'PUT'])
def updateAuxiliar(request, pk=None):
    if request.method == 'GET':
        auxiliar = auxiliarModel.objects.filter(id=pk).first()
        serialize = SerializationclassAuxiliar(auxiliar)
        return Response(serialize.data)
    elif request.method == 'PUT':
        auxiliar = auxiliarModel.objects.filter(id=pk).first()
        serialize = SerializationclassAuxiliar(auxiliar, data=request.data)
        if serialize.is_valid():
            serialize.save()
            return Response(serialize.data)
        return Response(serialize.errors)


@ api_view(['POST'])
def saveToken(request):
    if request.method == 'POST':
        saveserialize = SerializationclassTokens(data=request.data)
        if saveserialize.is_valid():
            tokenRequest = request.data["token"]
            token = tokensModel.objects.filter(token=tokenRequest).first()
            # print(token);
            if (token == None):
                saveserialize.save()
                token = tokensModel.objects.filter(token=tokenRequest).first()
                results = mensajesModel.objects.all()
                for x in results:
                    tokenMensaje = tokenMensajes(
                        token_id=token.id, mensaje_id=x.id)
                    tokenMensaje.save()
                    # print(tokenMensaje)

                return Response(saveserialize.data, status=status.HTTP_201_CREATED)
            else:
                return Response(saveserialize.data, status=status.HTTP_201_CREATED)
        else:
            return Response(saveserialize.data, status=status.HTTP_400_BAD_REQUEST)


class showToken(APIView):
    permission_classes = [IsAuthenticated]

    def get(self, request):
        if request.method == 'GET':
            results = tokensModel.objects.filter(esMovil=1)
            serialize = SerializationclassTokens(results, many=True)
            return Response(serialize.data)
