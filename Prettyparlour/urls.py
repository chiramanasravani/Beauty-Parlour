"""Prettyparlour URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/4.0/topics/http/urls/
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
from ast import If
from xml.dom.minidom import Document
from django.contrib import admin
from django.urls import path
from django.conf.urls.static import static
from django.conf import settings
from adminapp import views as admin_views
from parlourapp import views as parlourapp_views
from customerapp import views as customer_views
from mainapp import views as main_views
urlpatterns = [
    path('admin/', admin.site.urls),

   #admin
    path('admin_login',admin_views.admin_login,name='admin_login'),
    path('admin_dashboard', admin_views.admin_dashboard,name='admin_dashboard'),
    path('admin_feedback',admin_views.admin_feedback,name='admin_feedback'),
    path('admin_view_bookings',admin_views.admin_view_bookings,name='admin_view_bookings'),
    path('admin_view_customers', admin_views.admin_view_customers,name='admin_view_customers'),

    path('admin_view_parlour',admin_views.admin_view_parlour,name='admin_view_parlour'),
    path('accept_parlours/<int:id>/',admin_views.accept_parlours,name='accept_parlours'),
    path('reject_parlours/<int:id>/',admin_views.reject_parlours,name='reject_parlours'),

    path('admin_view_services/<int:id>/',admin_views.admin_view_services,name='admin_view_services'),
    path('admin_view_parlour_services/<int:id>/',admin_views.admin_view_parlour_services,name='admin_view_parlour_services'),
    # path('admin_view_parlour_logo', admin_views.admin_view_parlour_logo,name='admin_view_parlour_logo'),
    path('admin_view_services_logo',admin_views.admin_view_services_logo,name='admin_view_services_logo'),
   #beautician

    path('add_services',parlourapp_views.add_services,name='add_services'),
    path('edit_services/<int:id>/',parlourapp_views.edit_services,name='edit_services'),
    path('feedback',parlourapp_views.feedback,name='feedback'),
    path('customers',parlourapp_views.customers,name='customers'),
    path('demo',admin_views.demo,name='demo'),
    # path('accept_customers/<int:id>/',parlourapp_views.accept_customers,name='accept_customers'),
    # path('reject_customers/<int:id>/',parlourapp_views.reject_customers,name='reject_customers'),
   

    path('beautician_view_bookings/<int:id>/',parlourapp_views.beautician_view_bookings,name='beautician_view_bookings'),

    path('accept_bookings/<int:id>/',parlourapp_views.accept_bookings,name='accept_bookings'),
    path('reject_bookings/<int:id>/',parlourapp_views.reject_bookings,name='reject_bookings'),
   
    path('beautician_dashboard',parlourapp_views.beautician_dashboard,name='beautician_dashboard'),
     path('beautician_login',parlourapp_views.beautician_login,name='beautician_login'),
    path('beautician_register',parlourapp_views.beautician_register,name='beautician_register'),
   
    path('beautician_services',parlourapp_views.beautician_services,name='beautician_services'),
    path('beautician_view_services',parlourapp_views.beautician_view_services,name='beautician_view_services'),

    #customer html links.
   
    path('sms',customer_views.sms,name='sms'),
    path('customer_dashboard', customer_views.customer_dashboard,name='customer_dashboard'),
    path('view-services/<int:id>/',customer_views.view_customer_services,name='view_services'),
    path('customer_add_services/<int:id>/',customer_views.customer_add_services,name='customer_add_services'),
    path('customer_add_services',customer_views.customer_add_services,name='customer_add_services'),
    path('customer_book_services',customer_views.customer_book_services,name='customer_book_services'),
    path('customer_book_services/<int:id>/',customer_views.customer_book_services,name='customer_book_services'),
    path('booking_history',customer_views.booking_history,name='booking_history'),
    path('customer_feedback',customer_views.customer_feedback,name='customer_feedback'),
    path('customer_my_bookings',customer_views.customer_my_bookings,name='customer_my_bookings'),
    
    path('customer_payments_debitcard',customer_views.customer_payments_debitcard,name='customer_payments_debitcard'),
   
    path('customer_payments_credittcard',customer_views.customer_payments_credittcard,name='customer_payments_credittcard'),

    path('customer_payments_netbanking',customer_views.customer_payments_netbanking,name='customer_payments_netbanking'),
   
    path('edit_profile/<int:id>/',customer_views.edit_profile,name='edit_profile'),
    path('customer_profile',customer_views.customer_profile,name='customer_profile'),
    path('customer_login',customer_views.customer_login,name='customer_login'),
    path('customer_register',customer_views.customer_register,name='customer_register'),

    # mainapp htmlpages links.
    

    path('',main_views.home,name='home'),
    path('about', main_views.about,name='about'),
   
    path('contact',main_views.contact,name='contact'),
   

   
] + static(settings.MEDIA_URL,document_root=settings.MEDIA_ROOT)