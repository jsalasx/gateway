from django.db import models

class mensajesModel(models.Model):
    
    mensaje=models.TextField()
    fecha=models.DateTimeField()
    auxiliar=models.SmallIntegerField()
    class Meta:
        db_table='mensajes'

class auxiliarModel(models.Model):
    aux=models.SmallIntegerField()
    class Meta:
        db_table='auxiliar'

class tokensModel(models.Model):
    token=models.TextField()
    estadoToken=models.SmallIntegerField()
    class Meta:
        db_table='tokens'