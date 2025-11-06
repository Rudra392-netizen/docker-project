#pull the base image in which all the required libraries and dependencies are already installed
FROM python:3.9-slim
#Create a working Directory in which our source code will be present
WORKDIR /app
#Copy the source code from the host machine to the working directory inside the container
COPY app*.py /app
COPY requirements*.txt /app
copy templates /app/templates
#Install all the required dependencies which helps python code to run properly
RUN pip install -r requirements.txt
#Now expose the port number on which our application will run
EXPOSE 5001
#create a user and switch to that user
RUN useradd -m rudratech
USER rudratech
#Setting the environment variable 
ENV app_host=0.0.0.0
ENV app_port=50001
#Who is the maintainer of this dockerfile
LABEL CREATOR="rudratech"
#Command to run the application
CMD ["python", "app.py"]