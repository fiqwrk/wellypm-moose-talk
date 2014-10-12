package Cat;
use Moose;
use MooseX::FollowPBP;
use MooseX::Method::Signatures;

has 'name' => ( is      => 'ro',
                isa     => 'Str',
                default => 'Max', );

has 'grumpy' => ( is     => 'rw',
                 isa     => 'Bool',
                 default => 0,
                 reader  => 'is_grumpy');

no Moose;
1;
