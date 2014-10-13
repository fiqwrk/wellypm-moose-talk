package AllergicOwner;
use Test::Most;
use Test::Routine;
use Person;

has 'owner' => (
    is         => 'rw',
    isa        => 'Person',
    lazy_build => 1,
    clearer    => 'clear',
);

test 'Poor allergic Fred dies when stroking his cat' => sub {
    my $self = shift;
    throws_ok
      sub { $self->owner->stroke_pets() },
      qr/achoo/,
      'Death by cat';
};

sub _build_owner {
    my $self = shift;
    return Person->new(
        name    => 'Fred',
        allergy => 'Cat',
    );
}
1;
