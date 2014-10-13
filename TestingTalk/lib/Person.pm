package Person;
use Moose;
use MooseX::FollowPBP;
use MooseX::Method::Signatures;
use Cat;

has 'name' => ( is      => 'ro',
                isa     => 'Str',
                default => 'John Doh', );

has 'cats' => ( is     => 'rw',
               isa     => 'ArrayRef[Cat]',
               predicate  => 'owns_cat');

method is_happy(){
    $self->owns_cat && ! grep{ $_->is_grumpy } @{$self->get_cats} ;
}

method owns_cat_named( Str $cat ){
    return unless $self->cats;
    return grep{ $_->get_name eq $cat } @{$self->cats};
}

no Moose;
1;

