# Define parameters
$region = "us-east-1"  # Replace with your desired region
$instanceType = "t2.micro"
$amiId = "ami-xxxxxxxxxxxxxxxxx"  # Replace with your desired AMI ID
$keyPairName = "your-key-pair-name"  # Replace with your key pair name
$securityGroupId = "sg-xxxxxxxxxxxxxxxxx"  # Replace with your security group ID
$instanceName = "MyEC2Instance"  # Replace with your desired instance name

# Launch the EC2 instance
$instance = New-EC2Instance -ImageId $amiId -InstanceType $instanceType -KeyName $keyPairName -SecurityGroupId $securityGroupId -Region $region

# Wait for the instance to be in a running state
Write-Host "Creating EC2 instance..."
$instance | Wait-EC2Instance -Region $region

# Get the public DNS name of the instance
$publicDns = $instance.Instances[0].PublicDnsName

Write-Host "EC2 instance created with Instance ID: $($instance.Instances[0].InstanceId)"
Write-Host "Public DNS: $publicDns"
