#------------------Public-subnets--------------------------------
resource "aws_subnet" "pub-sub-1" {
  vpc_id                  = aws_vpc.myvpc.id
  cidr_block              = "10.0.1.0/24"
  map_public_ip_on_launch = true
  tags = {
    "Name"                         = "pub subnet 1"
    "kubernetes.io/role/elb"       = "1"
    "kubernetes.io/cluster/my-eks" = "owned"
  }
  availability_zone = "us-east-1a"
}

resource "aws_subnet" "pub-sub-2" {
  vpc_id                  = aws_vpc.myvpc.id
  cidr_block              = "10.0.4.0/24"
  map_public_ip_on_launch = true
  tags = {
    "Name"                         = "pub subnet 2"
    "kubernetes.io/role/elb"       = "1"
    "kubernetes.io/cluster/my-eks" = "owned"
  }
  availability_zone = "us-east-1b"
}
#------------------Private-subnets--------------------------------
resource "aws_subnet" "private-sub1" {
  vpc_id     = aws_vpc.myvpc.id
  cidr_block = "10.0.2.0/24"
  tags = {
    "Name"                            = "priv1"
    "kubernetes.io/role/internal-elb" = "1"
    "kubernetes.io/cluster/my-eks"    = "owned"
  }
  availability_zone = "us-east-1a"
}

resource "aws_subnet" "private-sub2" {
  vpc_id     = aws_vpc.myvpc.id
  cidr_block = "10.0.3.0/24"
  tags = {
    "Name"                            = "priv2"
    "kubernetes.io/role/internal-elb" = "1"
    "kubernetes.io/cluster/my-eks"    = "owned"
  }
  availability_zone = "us-east-1b"
}
