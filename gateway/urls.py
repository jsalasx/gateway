"""gateway URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/3.2/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.contrib import admin
from django.urls import path

from . import views
from rest_framework_simplejwt.views import (
    TokenObtainPairView,
    TokenRefreshView,
)

urlpatterns = [
    path('api/token/', TokenObtainPairView.as_view(), name='token_obtain_pair'),
    path('api/token/refresh/', TokenRefreshView.as_view(), name='token_refresh'),
    path('admin/', admin.site.urls),
    path('Show/', views.showMensajesUltimos, name="showMensajes"),
    path('ShowMensajesUltimos/', views.showMensajesUltimos,
         name="showMensajesUltimos"),
    path('ShowWithToken/', views.showMensajesWithToken,
         name="showMensajesWithToken"),
    path('ShowWithTokenMovil/', views.showMensajesWithTokenMovil,
         name="showMensajesWithTokenMovil"),
    path('AddMensajesLeidos/', views.AddMensajesLeidos, name="AddMensajesLeidos"),
    path('Insert/', views.saveMensajes.as_view(), name="saveMensajes"),
    path('Insert2/', views.saveAuxiliar, name="saveAuxiliar"),
    path('ShowAux/', views.showAuxiliar, name="showAuxiliar"),
    path('', views.showMensajes),
    path('auxiliar/<int:pk>', views.updateAuxiliar),
    path('tokens/', views.saveToken, name="saveToken"),
    path('ShowToken/', views.showToken.as_view(), name="showToken")
]
