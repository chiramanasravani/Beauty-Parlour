from ast import Pass
from django.shortcuts import get_object_or_404, render,redirect
from parlourapp.models import *
from customerapp.models import *
from django.contrib import messages
from .models import ParlourModel
from customerapp import *

# Create your views here.   
  
def add_services(request):
    
    parlour_id=request.session['parlour_id']
    beautician_name=ServicesModel.objects.filter(parlour_id=parlour_id).values('beautician_name')
    if request.method=='POST' and request.FILES['image'] and request.FILES['bimage']:        
        service_name=request.POST['service_name']
        price=request.POST['price']        
        message=request.POST['message']
        service_image=request.FILES['image']
        beautician_image=request.FILES['bimage']
        beautician_name=request.POST['beautician_name']       
        beautician = ServicesModel.objects.create(parlour=ParlourModel.objects.filter(parlour_id=parlour_id).first(),beautician_name=beautician_name,service_name=service_name,price=price,message=message,service_image=service_image,beautician_image=beautician_image)
        
        beautician.save()
        return redirect('beautician_dashboard')
    return render(request,'beautician/beautician-add-services.html')   
       
 #edit services start   
def edit_services(request,id):
    i = ServicesModel.objects.get(service_id=id)
    
    if request.method=='POST' and  "image" in request.FILES and "bimage" in request.FILES:
        service_name=request.POST['service_name']
        price=request.POST['price']
        beautician_name=request.POST['beautician_name']        
        service_image=request.FILES['image']
        beautician_image=request.FILES['bimage']
        data = get_object_or_404(ServicesModel,service_id=id)

        data.service_name = service_name
        data.price = price
        data.beautician_name = beautician_name
        data.service_image = service_image
        data.beautician_image = beautician_image
        data.save(update_fields=['service_name','price','beautician_name','service_image','beautician_image'])
        data.save()
        

        
        # edit = ServicesModel.objects.create(service_name=service_name,price=price,service_image=service_image,beautician_image=beautician_image)
        
        return redirect('beautician_dashboard')
         

    return render(request,'beautician/beautician-edit-services.html',{'i':i})
    
    #edit services end
   
def customers(request):
    data=CustomerModel.objects.all()
    # price=ServicesModel.objects.all().values('price')[0]['price']
    # print(price)
    return render(request,'beautician/beautician-view-customers.html',{'data':data})

# def accept_customers(request,id):
#     accept=get_object_or_404(CustomerModel,Customer_id=id)
#     accept.status='Accepted'
#     accept.save(update_fields=['status'])
#     accept.save()
#     return redirect('customers')

# def reject_customers(request,id):
#     reject=get_object_or_404(CustomerModel,Customer_id=id)
#     reject.status='Rejected'
#     reject.save(update_fields=['status'])
#     reject.save()
#     return redirect('customers') 


def beautician_view_bookings(request,id):
    parlour_id=request.session['parlour_id']

    
    button = ServicesModel.objects.filter(service_id=id)

    # parlour_id = ServicesModel.objects.filter(service_id=id).values_list("parlour_id")[0][0]
    # parlour_model = ParlourModel.objects.filter(parlour_id=id).values_list("parlour_id")[0][0]
    data=AppointmentModel.objects.filter(parlour_model=parlour_id)
    
    return render(request,'beautician/beautician-view-bookings.html',{'data':data,'button':button})



def accept_bookings(request,id):
    accept=get_object_or_404(AppointmentModel,booking_id=id)
    accept.status='Accepted'
    accept.save(update_fields=['status'])
    accept.save()
    return render(request,'#')

def reject_bookings(request,id):
    reject=get_object_or_404(AppointmentModel,booking_id=id)
    reject.status='Rejected'
    reject.save(update_fields=['status'])
    reject.save()
    return render(request,'#') 
     
def beautician_dashboard(request):
    parlour_id=request.session["parlour_id"]
    feedbacks=FeedbackModel.objects.count()
    customers=CustomerModel.objects.count()
    bookings=AppointmentModel.objects.count()
    button=ParlourModel.objects.filter(parlour_id=parlour_id)
    return render(request,'beautician/beautician-dashboard.html',{'feedbacks':feedbacks,'customers':customers, 'bookings':bookings,'b':button})
    


     

def feedback(request):
    feedback= FeedbackModel.objects.all()
    
  
    return render(request,'beautician/beautician-feedback.html',{'f':feedback})

#beautician login backend start



#beautician login backend end

#beautician register backend start
def beautician_register(request):
    if request.method=='POST' and request.FILES['logo'] and request.FILES['license']:
        parlour_name=request.POST['parlour_name']        
        password=request.POST['password']
        confirmpassword=request.POST['confirmpassword']
        mobile=request.POST['mobile']
        address=request.POST['address']
        license=request.FILES['license']
        logo=request.FILES['logo']
        email=request.POST['email']
        
        register = ParlourModel.objects.create(parlour_name=parlour_name,password=password,confirmpassword=confirmpassword,mobile=mobile,address=address,logo=logo,license=license,email=email)
        register.save()
        if register:
            messages.info(request,'Successfully Registered.')
            # messages.error(request,'Something Wrong, Please try again.')

            return redirect('beautician_login')
        else:
            messages.error(request,'Something Wrong, Please try again.')

    return render(request,'beautician/beautician-register.html')
    
#beautician register backend end
def beautician_login(request):
    if request.method == 'POST':
        email = request.POST.get('email')
        password = request.POST.get('password')
    try:
            check=ParlourModel.objects.get(email=email,password=password)
            request.session["parlour_id"]=check.parlour_id
            status=check.status
            if status=="Rejected":
                print("c")
                messages.warning(request,"your account is Rejected")
                return redirect('beautician_login')

            elif status == "Accepted":
                print("D")
                return redirect ('beautician_dashboard')
            # elif status=="pending":
            #     messages.warning(request,"your account is in pending not activated")
            # return render(request,'doctor/doctor-index.html')
            # return redirect('doctor-index')
    except:     
               Pass

               return render(request,'beautician/beautician-login.html')
              
   
    return render(request,'beautician/beautician-login.html')          
    #customer login backend start

def beautician_services(request):
    return render(request,'beautician/beautician-services.html')

def beautician_view_services(request):
    # service_id=request.session["parlour_id"]
    # data=ServicesModel.objects.filter(service_id=service_id)
    # print(data)
    parlour_id = request.session["parlour_id"]
    data = ServicesModel.objects.filter(parlour_id=parlour_id)
    return render(request,'beautician/beautician-view-services.html',{'data':data})      

    