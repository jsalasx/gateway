from django.db import models


class mensajesModel(models.Model):

    mensaje = models.TextField()
    fecha = models.DateTimeField()
    auxiliar = models.SmallIntegerField()

    class Meta:
        db_table = 'mensajes'


class auxiliarModel(models.Model):
    aux = models.SmallIntegerField()

    class Meta:
        db_table = 'auxiliar'


class tokensModel(models.Model):
    token = models.TextField()
    estadoToken = models.SmallIntegerField()
    esMovil = models.SmallIntegerField()

    class Meta:
        db_table = 'tokens'


class tokenMensajes(models.Model):
    token_id = models.IntegerField()
    mensaje_id = models.IntegerField()

    class Meta:
        db_table = 'token_mensajes'

# class tokenMensajesManager(models.Manager):
#    def create_tokenMensaje(self, token_id, mensaje_id):
#        tokenMensaje = self.create(token_id=token_id,mensaje_id=mensaje_id)
        # do something with the book
        # return tokenMensaje
