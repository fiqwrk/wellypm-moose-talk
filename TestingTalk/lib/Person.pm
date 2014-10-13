package Person;
use Moose;
use MooseX::FollowPBP;
use MooseX::Method::Signatures;
use Carp qw(croak);
use Cat;

has 'name' => ( is      => 'ro',
                isa     => 'Str',
                default => 'John Doh', );

has 'allergy' => ( is        => 'ro',
                   isa       => 'Str',
                   predicate => 'has_allergy');

has 'cats' => ( is     => 'rw',
                isa     => 'ArrayRef[Cat]',
                predicate  => 'owns_cat');

method stroke_pets(){
    return unless $self->owns_cat;
    if ($self->has_allergy){
        croak"achoo!" if grep { $self->is_allergic_to($_) } @{$self->get_cats};
    }    
}

method is_allergic_to( Object $obj ){
    my $allergy = $self->get_allergy;
    return 0 unless $allergy;
    return $obj && $allergy eq ref $obj;
};

method is_happy(){
    $self->owns_cat && ! grep{ $_->is_grumpy } @{$self->get_cats};
};

method owns_cat_named( Str $cat ){
    return unless $self->cats;
    return grep{ $_->get_name eq $cat } @{$self->cats};
}

no Moose;
1;

