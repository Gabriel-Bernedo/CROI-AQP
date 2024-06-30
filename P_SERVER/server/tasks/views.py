from django.shortcuts import render, redirect, get_object_or_404
from django.http import HttpResponse
from django.contrib.auth.forms import UserCreationForm, AuthenticationForm
from django.contrib.auth.models import User
from django.contrib.auth import authenticate, login, logout
from .forms import TaskForm
from .models import Task
from django.utils import timezone
from django.contrib.auth.decorators import login_required
import matlab.engine
from django.http import JsonResponse


def run_matlab(request):
    # Inicia el motor de MATLAB
    eng = matlab.engine.start_matlab()

    # Añade el directorio que contiene 'my_function.m' al path de MATLAB
    eng.addpath(r'/home/jorgeluis/matlab/bin/')
    
    # Ejecuta tu función MATLAB
    try:
        result = eng.my_function()
    except matlab.engine.MatlabExecutionError as e:
        eng.quit()
        return JsonResponse({'error': str(e)})

    # Detiene el motor de MATLAB
    eng.quit()

    # Devuelve el resultado como una respuesta JSON
    return JsonResponse({'result': result})

# Create your views here.
def home(request):
    return render(request,'home.html')

def signup(request):
    
    if(request.method=='GET'):
        return render(request, 'signup.html',{
               'form':UserCreationForm})
    else:
        if request.POST['password1']==request.POST['password2']:
            try :
                user=User.objects.create_user(username=request.POST['username'],
                                     password=request.POST['password1'])    
                user.save()
                login(request, user)
                return redirect('tasks')
            except:
                return render(request, 'signup.html',{
                             'form':UserCreationForm,
                             'error':"...El usuario ya existe..."})
        else:        
            return render(request, 'signup.html',{
                             'form':UserCreationForm,
                             'error':"...Contraseñas no coinciden..."})
    
@login_required    
def tasks(request):
    tasks = Task.objects.filter(user=request.user, datecompleted__isnull=True)
    
    return render( request,'tasks.html',{'tasks':tasks})

@login_required
def tasks_completed(request):
    tasks = Task.objects.filter(user=request.user, 
    datecompleted__isnull=False).order_by('-datecompleted')
    
    return render( request,'tasks.html',{'tasks':tasks})

@login_required
def create_task(request):
    
    if request.method == 'GET':
        return render (request , 'create_task.html',{'form':TaskForm})
    else:
        try:
            form = TaskForm(request.POST)
            new_task = form.save(commit=False)
            new_task.user=request.user
            new_task.save()
        
            return redirect('tasks')
        except ValueError:
            return render(request, 'create_task.html',{
                             'form':TaskForm,
                             'error':"...Provee un dato valido..."})

login_required
def task_detail(request, task_id):
    if request.method == 'GET':
        task = get_object_or_404(Task,pk=task_id, user=request.user)
        form = TaskForm(instance=task)
        return render(request, 'task_detail.html', {'task': task,'form':form})
    else:
        try:
            task = get_object_or_404(Task,pk=task_id, user=request.user)
            form = TaskForm(request.POST, instance=task)
            form.save()
            return redirect('tasks')
        except ValueError:
            return render(request, 'task_detail.html', {'task': task,'form':form,
                             'error':"...Error actualizando ..."})

@login_required
def complete_task(request, task_id):
    task = get_object_or_404(Task, pk=task_id, user=request.user)
    if request.method == 'POST':
        task.datecompleted = timezone.now()
        task.save()
        return redirect('tasks')

@login_required
def delete_task(request, task_id):
    task = get_object_or_404(Task, pk=task_id, user=request.user)
    if request.method == 'POST':
        task.delete()
        return redirect('tasks')

@login_required
def signout(request):
    logout(request)
    return redirect('home')

def signin(request):
    if request.method == 'GET':
        return render( request,'signin.html',
                  {'form':AuthenticationForm}) 
    else:
        
        user=authenticate(request, username=request.POST['username'], 
                     password=request.POST['password'])
        
        if user is None:
            return render( request,'signin.html',
                  {'form':AuthenticationForm,
                   'error':"...Usuario o contraseña incorrectos..."})     
        else:
            login(request, user)
            return redirect('tasks')
                   
        return render( request,'signin.html',
                  {'form':AuthenticationForm}) 
