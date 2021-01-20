# ---------------------------------------------------------------------------------------------------------------------
# AWS Security Groups - Control Access to ALB
# ---------------------------------------------------------------------------------------------------------------------
resource "aws_security_group" "alb_sg" {
    name        = "${var.name_preffix}-jenkins-master-alb-sg"
    description = "Control access to ALB"
    vpc_id      = "${var.vpc_id}"
    ingress {
        protocol    = "tcp"
        from_port   = 80
        to_port     = 80
        cidr_blocks = ["0.0.0.0/0"]
    }
    ingress {
        protocol    = "tcp"
        from_port   = 50000
        to_port     = 50000
        cidr_blocks = ["0.0.0.0/0"]
    }
    egress {
        protocol  = "-1"
        from_port = 0
        to_port   = 0
        cidr_blocks = ["0.0.0.0/0"]
    }
    tags {
        Name = "${var.name_preffix}-jenkins-master-alb-sg"
    }
}

# ---------------------------------------------------------------------------------------------------------------------
# AWS Security Groups - ECS Tasks, allow traffic only from Load Balancer
# ---------------------------------------------------------------------------------------------------------------------
resource "aws_security_group" "ecs_tasks_sg" {
    name        = "${var.name_preffix}-jenkins-master-ecs-tasks-sg"
    description = "Allow inbound access from the ALB only"
    vpc_id      = "${var.vpc_id}"
    ingress {
        protocol        = "tcp"
        from_port       = "${local.jenkins_container_web_port}"
        to_port         = "${local.jenkins_container_web_port}"
        security_groups = ["${aws_security_group.alb_sg.id}"]
    }
    ingress {
        protocol        = "tcp"
        from_port       = "${local.jenkins_container_slave_port}"
        to_port         = "${local.jenkins_container_slave_port}"
        security_groups = ["${aws_security_group.alb_sg.id}"]
    }
    egress {
        protocol    = "-1"
        from_port   = 0
        to_port     = 0
        cidr_blocks = ["0.0.0.0/0"]
    }
}
