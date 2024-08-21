from django.db import models

# Create your models here.
from curses import meta
#register
class ParlourModel(models.Model):
    parlour_id=models.AutoField(primary_key=True)
    parlour_name=models.CharField(help_text='Enter Your Name',max_length=50)
    email=models.CharField(help_text='Enter Your email', max_length=50,null=True)
    password=models.CharField(help_text='Enter Your Password', max_length=50)
    confirmpassword=models.CharField(help_text='confirmpassword', max_length=50,null=True)
    mobile=models.BigIntegerField(help_text='Enter Your mobile_number')
    address=models.CharField(help_text='Enter Your address', max_length=200)
    license=models.ImageField(upload_to='images/logo/')
    logo=models.ImageField(upload_to='logo/images/')
    
    status=models.CharField(max_length=50,default='pending',null=True)
    reg_date=models.DateField(auto_now_add=True,null=True)

    class Meta:
        db_table='parlour_details'

# add services start
class ServicesModel(models.Model):

    service_id=models.AutoField(primary_key=True) 
    parlour=models.ForeignKey(ParlourModel,db_column='parlour_id', related_name='parlour',on_delete=models.CASCADE,null=True,blank=True)
    # services=models.CharField(help_text='services',max_length=100)
    beautician_name=models.TextField(help_text='beautician name',max_length=100,null=True)
    service_name=models.CharField(help_text='service_name', max_length=50)
    price=models.CharField(help_text='price',max_length=50)
    message=models.TextField(help_text='message',max_length=200)
    
    service_image=models.ImageField(upload_to='services/',null=True)
    beautician_image=models.ImageField(upload_to='beauticians/',null=True)
   
    # status=models.CharField(max_length=50,default='pending',null=True)
    service_date_added=models.DateField(auto_now_add=True,null=True)

    class Meta:
        db_table='parlour_services' 
#add services end

# edit services start
# class Edit_ServisesModel(models.Model):

#     parlour_id=models.AutoField(primary_key=True) 
#     services=models.CharField(help_text='services',max_length=100)
   
#     sub_services=models.CharField(help_text='sub_services',max_length=100)
#     service_name=models.CharField(help_text='service_name', max_length=20)
#     price=models.CharField(help_text='price',max_length=50)
#     message=models.TextField(help_text='message',max_length=200)
    
#     image=models.ImageField(upload_to='logo/images/')
   
#     status=models.CharField(max_length=50,default='pending',null=True)
#     reg_date=models.DateField(auto_now_add=True,null=True)

#     class Meta:
#         db_table='parlour_edit_services' 
#edit services end