package Person;
use Moose;
use MooseX::FollowPBP;
use MooseX::Method::Signatures;
use Cat;

has 'name' => ( is      => 'ro',
                isa     => 'Str',
                default => 'John Doh', );

has 'cats' => ( is     => 'ro',
               isa     => 'ArrayRef[Cat]',
               predicate  => 'owns_cat');

method is_happy(){
    $self->owns_cat;
}

no Moose;
1;

