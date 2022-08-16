resource "aws_lb" "load_balancer" {
  name               = "nlb"
  internal           = false
  load_balancer_type = "network"
  subnets            = [aws_subnet.public_1.id,aws_subnet.public_2.id]

  enable_deletion_protection = false
    tags = {
    Environment = "elb-example"
  }
}

resource "aws_lb_listener" "front_end" {
  load_balancer_arn = aws_lb.load_balancer.arn
  port              = "80"
  protocol          = "TCP"

  default_action {
    type = "forward"
    target_group_arn = aws_lb_target_group.test.arn

    }
}

resource "aws_lb_target_group" "test" {
  name     = "test-softserve"
  port     = 80
  protocol = "TCP"
  target_type="instance"
  vpc_id   = aws_vpc.vpc.id
}

resource "aws_lb_target_group_attachment" "test" {
  target_group_arn = aws_lb_target_group.test.arn
  target_id        = aws_instance.elb_instance_1.id
  port             = 80
}
resource "aws_lb_target_group_attachment" "test1" {                                                                                                
  target_group_arn = aws_lb_target_group.test.arn
  target_id        = aws_instance.elb_instance_2.id
  port             = 80
}


output "load_balancer" {
  description = "The DNS name of the ELB"
  value       = aws_lb.load_balancer.dns_name
}