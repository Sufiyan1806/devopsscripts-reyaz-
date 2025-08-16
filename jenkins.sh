# STEP-1: Update system
sudo apt update -y
sudo apt upgrade -y

# STEP-2: Install Git and Maven
sudo apt install git maven -y

# STEP-3: Add Jenkins repository key
curl -fsSL https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key | sudo tee \
  /usr/share/keyrings/jenkins-keyring.asc > /dev/null

# STEP-4: Add Jenkins repository
echo deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] \
  https://pkg.jenkins.io/debian-stable binary/ | sudo tee \
  /etc/apt/sources.list.d/jenkins.list > /dev/null

# STEP-5: Install Java 17 (Amazon Corretto not available in Ubuntu by default, so use OpenJDK)
sudo apt install openjdk-17-jdk -y

# STEP-6: Install Jenkins
sudo apt update -y
sudo apt install jenkins -y

# STEP-7: Start and check Jenkins status
sudo systemctl start jenkins
sudo systemctl status jenkins

# STEP-8: Enable Jenkins to start on boot
sudo systemctl enable jenkins
