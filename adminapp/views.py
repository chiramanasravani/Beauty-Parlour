from django.shortcuts import get_object_or_404, redirect, render
from parlourapp.models import *
from customerapp.models import *

# Create your views here.
def admin_dashboard(request):
    parlours=ParlourModel.objects.count()
    customers=CustomerModel.objects.count()
    bookings=AppointmentModel.objects.count()
    return render(request,'admin/admin-dashboard.html',{'parlours':parlours,'customers':customers, 'bookings':bookings})
    
def admin_feedback(request):
    feedback= FeedbackModel.objects.all()
    return render(request,'admin/admin-feedback.html',{'f':feedback})
    
def admin_view_bookings(request):
    app= AppointmentModel.objects.all()
    return render(request,'admin/admin-view-bookings.html',{'app':app})
    
    

def admin_view_customers(request):
    data=CustomerModel.objects.all()
    return render(request,'admin/admin-view-customers.html',{'data':data})

def admin_view_parlour(request):
    app=ParlourModel.objects.all()
    return render(request,'admin/admin-view-parlour.html',{'app': app})

def accept_parlours(request,id):
    accept=get_object_or_404(ParlourModel,parlour_id=id)
    accept.status='Accepted'
    accept.save(update_fields=['status'])
    accept.save()
    return redirect('admin_view_parlour')

def reject_parlours(request,id):
    reject=get_object_or_404(ParlourModel,parlour_id=id)
    reject.status='Rejected'
    reject.save(update_fields=['status'])
    reject.save()
    return redirect('admin_view_parlour')

def admin_view_services(request):
    data = ServicesModel.objects.all()
    return render(request,'admin/admin-view-services.html',{'data':data})
     
def admin_view_parlour_services(request,id):
    data=ServicesModel.objects.filter(parlour_id=id)
    return render(request,'admin/admin-view-services.html',{'data':data})       

    
    
def admin_view_services_logo(request):
    data=ParlourModel.objects.all()
    return render(request,'admin/admin-view-services-logo.html',{'data':data})

#admin Login Backend Start
def admin_login(request):
    if request.method=='POST':
        email=request.POST.get('email')
        password=request.POST.get('password')
        if email=='cloud' and password=='cloud':
            return redirect('admin_dashboard')
        elif email=='admin@gmail.com' and password=='admin':
            return redirect('admin_dashboard')


    return render(request,'beautician/admin-login.html')
    #admin Login Backend end

def demo(request):
    
    return render(request,'admin/test.html')