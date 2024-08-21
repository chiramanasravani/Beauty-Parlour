from ast import Pass
from urllib import request
from parlourapp.models import ParlourModel, ServicesModel
from email.headerregistry import Address
from unicodedata import name
from django.shortcuts import render,redirect,get_object_or_404
from customerapp.models import *
from django.contrib import messages
from parlourapp.views import *
# Create your views here.

def sms(request):
    return render(request,'customer/sms.html')
    
def customer_dashboard(request):
    msg=ParlourModel.objects.all()
    # parlour_id = request.session["parlour_id"]


    return render(request,'customer/customer-dashboard.html',{'msg':msg})
    
    # parlour_id = request.session["parlour_id"]
    # data = ServicesModel.objects.filter(parlour_id=parlour_id)
    # return render(request,'beautician/beautician-view-services.html',{'data':data})
def view_customer_services(request,id):
    msg=ServicesModel.objects.filter(parlour_id=id)
    print(id)
    print(msg)
    
    return render(request,'customer/customer-add-services.html',{'msg':msg})       


def customer_add_services(request):
    data = ServicesModel.objects.all()
    return render(request,'customer/customer-add-services.html',{'data':data})
    
def customer_book_services(request,id):
    Customer_id=request.session['Customer_id']
    data=CustomerModel.objects.filter(Customer_id=Customer_id)
    beautician = ServicesModel.objects.filter(service_id=id)
    parlour_id = ServicesModel.objects.filter(service_id=id).values_list("parlour_id")[0][0]
    
    parlour_model = ParlourModel.objects.filter(parlour_id=parlour_id).values_list("parlour_id")[0][0]

    print(parlour_id)
    
    if request.method=='POST':  
        name=request.POST ['name']        
        mobile_number=request.POST['mobile_number']
        email=request.POST['email']
        date=request.POST['date']
        time=request.POST['time']
        type_of_address=request.POST['type_of_address']
        home_address=request.POST['home_address']
        parlour_name=request.POST['parlour_name']
        beautician_name=request.POST['beautician_name']
        members=request.POST['members']
        service=request.POST['service']
        
        chanu = AppointmentModel.objects.create(name=name,mobile_number=mobile_number,email=email,date=date,time=time,type_of_address=type_of_address,home_address=home_address,parlour=parlour_name,beautician=beautician_name,members=members,service=service,parlour_model=ParlourModel.objects.filter(parlour_id=parlour_id)[0],customer_model=CustomerModel.objects.filter(Customer_id=Customer_id)[0])
        chanu.save()
        if chanu:
            messages.info(request,'Thank you for your Appointment')
           
    return render(request,'customer/customer-book-services.html',{'b':beautician,'d':data})
    
  

def booking_history(request):
    app=AppointmentModel.objects.all()
    price=ServicesModel.objects.all().values('price')[0]['price']
    print(price)
    return render(request,'customer/customer-booking-hystory.html',{'app': app,'price':price})

#feedback start
def customer_feedback(request):
    Customer_id=request.session['Customer_id']
    if request.method=='POST':
        name=request.POST['name']        
        email=request.POST['email']
        feedback=request.POST['feedback']
        customer_details=CustomerModel.objects.get(Customer_id=Customer_id)
        customer_image=customer_details.image
        feedback = FeedbackModel.objects.create(name=name,email=email,feedback=feedback,customer_image=customer_image)
        feedback.save()
        messages.info(request,"Thank you for your feedback")
       
    return render(request,'customer/customer-feedback.html')
#feedback end

        

def customer_payments_debitcard(request):
    return render(request,'customer/customer-payments.html')
    
    

def customer_payments_credittcard(request):
    return render(request,'customer/customer-payments.html')

def customer_my_bookings(request):
    Customer_id = request.session["Customer_id"]
    data =AppointmentModel.objects.filter(customer_model=Customer_id)
    return render(request,'customer/customer-my-bookings.html',{'data': data}) 


def customer_payments_netbanking(request):
    return render(request,'customer/customer-payments.html')
 #profile start
def customer_profile(request):
    Customer_id = request.session["Customer_id"]
    data = CustomerModel.objects.get(Customer_id=Customer_id)
    # profile=CustomerModel.objects.all()
    
    return render(request,'customer/customer-profile.html',{'data': data})

def edit_profile(request,id):
    edit = CustomerModel.objects.get(Customer_id=id)  
   
    if request.method=='POST' and "image" in request.FILES:
        name=request.POST['name']
        mobile_number=request.POST['mobile_number']
        email=request.POST['email'] 
        image=request.FILES['image']       
        obj = get_object_or_404(CustomerModel,Customer_id=id)
        obj.name = name
        obj.mobile_number = mobile_number
        obj.email = email
        obj.image = image
        obj.save()
        
        return redirect('customer_profile')
    return render(request,'customer/customer-edit-profile.html',{'i':edit})


def customer_register(request):
    if request.method=='POST' and request.FILES['image']:
        name=request.POST ['name']        
        password=request.POST['password']
        mobile_number=request.POST['mobile_number']
        email=request.POST['email']
        birthday=request.POST['birthday']
        location=request.POST['location']
        image=request.FILES['image']
        chanu = CustomerModel.objects.create(name=name,password=password,mobile_number=mobile_number,email=email,birthday=birthday,location=location,image=image)
        chanu.save()

        if chanu:

             messages.info(request,'Successfully Registered.')
             return redirect('customer_login')
        else:
             messages.error(request,'Something Wrong, Please try again.')
    return render(request,'customer/customer-register.html')
    

    
#customer login backend start
def customer_login(request):
    print("A")
    if request.method=='POST':
         email=request.POST.get('email')
         password=request.POST.get('password')
    try:     
            print("B")
            check=CustomerModel.objects.get(email=email,password=password)
            request.session["Customer_id"]=check.Customer_id
            status=check.status
            if status=="Rejected":
                print("c")
                
            elif status == "Accepted":
                print("D")
                return redirect ('customer_dashboard')       
    except:      
          Pass
    return render(request,'customer/customer-login.html')          
    #customer login backend start

