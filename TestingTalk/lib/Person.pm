package Person;
use Moose;
use MooseX::FollowPBP;
use MooseX::Method::Signatures;

has 'name' => ( is      => 'ro',
                isa     => 'Str',
                default => 'John Doh', );

has 'cats' => ( is     => 'ro',
               isa     => 'Bool',
               default => 0,
               reader  => 'owns_cat');

method is_happy(){
    $self->owns_cat;
}

no Moose;
1;

