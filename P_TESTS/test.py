import matlab.engine

eng = matlab.engine.start_matlab()
eng.addpath(r'C:\Users\ASUS\Documents\Github\CROI-AQP\F_MATLAB')


try:
    print(eng.CalcularROI(100,10))
    print(eng.Hello())
except matlab.engine.MatlabExecutionError as e:
    eng.quit()

eng.quit()
# def run_matlab():
#     # Inicia el motor de MATLAB

#     # Añade el directorio que contiene 'my_function.m' al path de MATLAB
    
#     # Ejecuta tu función MATLAB
#     result = -15
#     try:
#         result = eng.CalcularROI(100,10)
#     except matlab.engine.MatlabExecutionError as e:
#         eng.quit()
    
#     return result

# print(run_matlab())