output "vpc_id" {
    value = aws_vpc.tenacity-vpc.id
}


output "vpc_cidr_block" {
    value = aws_vpc.tenacity-vpc.cidr_block
}


output "Prod-pub-sub1_subnet_id" {
    value = aws_subnet.Prod-pub-sub1.id
}


output "Prod-pub-sub1_cidr_block" {
    value = aws_subnet.Prod-pub-sub1.cidr_block
}


output "Prod-pub-sub2_subnet_id" {
    value = aws_subnet.Prod-pub-sub2.id
}


output "Prod-pub-sub2_cidr_block" {
    value = aws_subnet.Prod-pub-sub2.cidr_block
}


output "Prod-priv-sub1_subnet_id" {
    value = aws_subnet.Prod-priv-sub1.id
}


output "Prod-priv-sub1_cidr_block" {
    value = aws_subnet.Prod-priv-sub1.cidr_block
}


output "Prod-priv-sub2_subnet_id" {
    value = aws_subnet.Prod-priv-sub2.id
}


output "Prod-priv-sub2_cidr_block" {
    value = aws_subnet.Prod-priv-sub2.cidr_block
}


output "Prod-pub-route-table_id" {
    value = aws_route_table.Prod-pub-route-table.id
}


output "Prod-priv-route-table_id" {
    value = aws_route_table.Prod-priv-route-table.id
}


output "Prod-igw_id" {
    value = aws_internet_gateway.Prod-igw.id
}


output "Prod-Nat-gateway_id" {
    value = aws_nat_gateway.Prod-Nat-gateway.id
}


output "Elastic_IP_id" {
    value = aws_eip.Prod-eip.id
}