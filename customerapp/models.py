from xml.etree.ElementInclude import default_loader
from django.db import models

from parlourapp.models import ParlourModel


# customer register model
class CustomerModel(models.Model):
    Customer_id=models.AutoField(primary_key=True)
    name=models.CharField(help_text='Enter Your Name',max_length=50)
    password=models.CharField(help_text='Enter Your Password', max_length=50)
    mobile_number=models.BigIntegerField(help_text='Enter Your mobile_number')
    email=models.EmailField(help_text='Enter Your email', max_length=50)
    birthday=models.DateField(help_text='Date of Birthday',null=True)
    location=models.CharField(help_text='Location', max_length=200,null=True)

    image=models.ImageField(upload_to='logo/images/',null=True)
    status=models.CharField(max_length=50,default='pending',null=True)
    reg_date=models.DateField(auto_now_add=True,null=True)

    class Meta:
        db_table='customer_details'
# customer register model

# appoinment start
class AppointmentModel(models.Model):
    booking_id=models.AutoField(primary_key=True) 
    parlour_model=models.ForeignKey(ParlourModel,db_column='parlour_id', related_name='parlourmodel',on_delete=models.CASCADE,null=True,blank=True)
    customer_model=models.ForeignKey(CustomerModel,db_column='Customer_id', related_name='Customermodel',on_delete=models.CASCADE,null=True,blank=True)
    name=models.CharField(help_text='name',max_length=50)
    mobile_number=models.BigIntegerField(help_text='mobile_number')
    email=models.EmailField(help_text='email', max_length=50)
    date=models.DateField(help_text='date')
    time=models.TimeField(help_text='time')
    type_of_address=models.CharField(help_text='type_of_address', max_length=200)
    home_address=models.CharField(help_text='home_address', max_length=200)
    parlour=models.CharField(help_text='parlour_name', max_length=200)
    beautician=models.CharField(help_text='beautician', max_length=50, default="True")
    members=models.CharField(help_text='members', max_length=10)
    service=models.CharField(help_text='service',max_length=20, null="True")
    status=models.CharField(max_length=50,default='pending',null="True")
    reg_date=models.DateField(auto_now_add=True,null=True)
    class Meta:
        db_table='customer_appoinment' 

# feedback start      

class FeedbackModel(models.Model):
    feedback_id=models.AutoField(primary_key=True)
    name=models.CharField(help_text='name',max_length=50)
    email=models.EmailField(help_text='email', max_length=50)
    feedback=models.TextField(help_text='feedback', max_length=350,null=True)
    reg_date=models.DateField(auto_now_add=True,null=True)
    customer_image=models.CharField(null=True,blank=True,max_length=200)

    class Meta:
        db_table='customer_feedback'

   #feedback end     