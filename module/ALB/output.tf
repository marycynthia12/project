output "alb_dns_name" {
  value = aws_lb.shopnaija_lb.dns_name
}

output "alb_zone_id" {
  value = aws_lb.shopnaija_lb.zone_id
}

output "target_group_arn" {
  value = aws_lb_target_group.app.arn
}