resource "aws_athena_named_query" "rejected" {
  name     = "${var.name}-rejected-traffic"
  database = "default"
  query    = "SELECT srcaddr, dstaddr, dstport, protocol, count(*) AS hits FROM vpc_flow_logs WHERE action = 'REJECT' GROUP BY 1, 2, 3, 4 ORDER BY hits DESC LIMIT 50;"
}
