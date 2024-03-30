.PHONY: install train run clean docker-build docker-run

# Install dependencies
install:
	pip install -r requirements.txt

# Train the model and save it
train:
	python main.py

# Run the Flask application
run:
	python app.py

# Clean up the project directory
clean:
	rm -f *.pkl
	rm -f *.joblib

# Build the Docker image
docker-build:
	docker build -t iris_model_app .

# Run the Docker container
docker-run:
	docker run -p 5000:5000 iris_model_app

# Train the model, build the Docker image and run the Docker container
all: train docker-build docker-run
