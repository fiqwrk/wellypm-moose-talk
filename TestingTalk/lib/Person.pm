package Person;
use Moose;
use MooseX::FollowPBP;
use MooseX::Method::Signatures;

has 'name' => ( is      => 'ro',
                isa     => 'Str',
                default => 'John Doh', );

has 'cats' => ( is      => 'ro',
               isa     => 'Bool',
               default => 'John Doh',
               reader  => 'owns_cat');

sub is_happy {
    my $self = shift;
    $self->owns_cat;
}

no Moose;
1;

