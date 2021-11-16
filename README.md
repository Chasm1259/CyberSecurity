# CyberSecurity
Project Files from Cybersecurity Bootcamp

This is a collection of files created during cybersecurity bootcamp.  It contains a network diagram of a cloud network I set up on Azure, as well as some Linux script files and Ansible .yml files for remote container deployment.

README for Cloud Network Deployment:

## Automated ELK Stack Deployment

The files in this repository were used to configure the network depicted below.

Diagrams\NetworkDiagram.png

These files have been tested and used to generate a live ELK deployment on Azure. They can be used to either recreate the entire deployment pictured above. Alternatively, select portions of the install-elk.yml, install-filebeat.yml, and install-metricbeat.yml files may be used to install only certain pieces of it, such as Filebeat.

This document contains the following details:
- Description of the Topologu
- Access Policies
- ELK Configuration
  - Beats in Use
  - Machines Being Monitored
- How to Use the Ansible Build


### Description of the Topology

The main purpose of this network is to expose a load-balanced and monitored instance of DVWA, the D*mn Vulnerable Web Application.

Load balancing ensures that the application will be highly available, in addition to restricting access to the network.

Integrating an ELK server allows users to easily monitor the vulnerable VMs for changes to the files and system logs.

The configuration details of each machine may be found below.

| Name                        | Function          | IP Address              | Operating System   |
|-----------------------------|-------------------|-------------------------|--------------------|
| RedTeamJump-Box-Provisioner | Gateway           | 13.90.63.24, 10.0.0.7   | Linux Ubuntu 20.04 |
| Web-1                       | Web Server        | 10.0.0.8                | Linux Ubuntu 20.04 |
| Web-1                       | Web Server        | 10.0.0.9                | Linux Ubuntu 20.04 |
| ELKVM                       | ELK Stack Machine | 40.122.240.32, 10.1.0.4 | Linux Ubuntu 20.04 |

### Access Policies

The machines on the internal network are not exposed to the public Internet. 

Only the jump box machine (13.90.63.24) can accept connections from the Internet. Access to this machine is only allowed from the following IP addresses:  108.18.20.15 (my local machine)

Machines within the network can only be accessed by the jump box machine (13.90.63.24).

A summary of the access policies in place can be found in the table below.

| Name                        | Publicly Accessible | Allowed IP Addresses   |
|-----------------------------|---------------------|------------------------|
| RedTeamJump-Box-Provisioner | Yes                 | 108.18.20.15           |
| Web-1                       | No                  | 10.0.0.7               |
| Web-2                       | No                  | 10.0.0.7               |
| ELKVM                       | Yes                 | 108.18.20.15, 10.0.0.7 |

### Elk Configuration

Ansible was used to automate configuration of the ELK machine. No configuration was performed manually, which is advantageous because it saves time and also eliminates the possibility of human error

The playbook implements the following tasks:
-Upgrade the memory usage of the system it's being installed on
-Install and enable the Docker.io container
-Install  pip3
-Install and enable ELK

The following screenshot displays the result of running `docker ps` after successfully configuring the ELK instance.

Diagrams\ConfirmELKConfiguration.png

### Target Machines & Beats
This ELK server is configured to monitor the following machines:
10.0.0.8
10.0.0.9

We have installed the following Beats on these machines:
MetricBeat
FileBeat

These Beats allow us to collect the following information from each machine:
FileBeat:  This collects log data about basic system functions.  I would exect to see log entries for Linux system logs, which would be used to track many types of events on the machines, including service errors, security logs, logon events etc.
MetricBeat:  This concatonates log data into metric data.  This allows us to more easily view and categorize the log data we are receiving.

### Using the Playbook
In order to use the playbook, you will need to have an Ansible control node already configured. Assuming you have such a control node provisioned: 

SSH into the control node and follow the steps below:
- Copy the Install-elk.yml file to etc/ansible.
- Update the hosts file to include:

[webservers]
#Web-2
10.0.0.9 ansible_pthyon_interpreter=/usr/bin/python3
#Web-1
10.0.0.8 ansible_python_interpreter=/usr/bin/python3

[elk]
#ELKVM
10.1.0.4 ansible_python_interpreter=/usr/bin/python3

- Run the playbook, and navigate to http://40.122.240.32:5601/app/kibana to check that the installation worked as expected.
