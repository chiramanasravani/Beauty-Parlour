from django.shortcuts import render
from mainapp.models import ContactModel

from parlourapp.models import ParlourModel, ServicesModel
from customerapp.models import FeedbackModel
from django.contrib import messages


# Create your views here.

def home(request):
    parlours = ParlourModel.objects.all()
    # beauticians = ServicesModel.objects.filter(status='activated')
    data=ServicesModel.objects.all()
    feedback= FeedbackModel.objects.all()
    return render(request,'main/index.html',context={'parlours':parlours,'data':data,'f':feedback})

    
def about(request):
    return render(request,'main/about.html')
    
    
def contact(request):
    if request.method == 'POST':
        name= request.POST['name']
        email = request.POST['email']
        subject = request.POST['subject']
        message = request.POST['message']
        ContactModel.objects.create(name=name,email=email,subject=subject,message=message)
        messages.info(request,"we will contact with you soon")
    return render(request,'main/contact.html')



