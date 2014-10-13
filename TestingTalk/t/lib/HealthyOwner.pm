package HealthyOwner;
use Test::Most;
use Test::Routine;
use Person;

has 'owner' => (
    is         => 'rw',
    isa        => 'Person',
    lazy_build => 1,
    clearer    => 'clear',
);

test 'Healthy Fred can happily stroke his cat' => sub {
    my $self = shift;
    lives_ok
      sub { $self->owner->stroke_pets() },
      'Cat purrs and Fred lives';
};

sub _build_owner {
    my $self = shift;
    return Person->new( name => 'Fred', );
}
1;
