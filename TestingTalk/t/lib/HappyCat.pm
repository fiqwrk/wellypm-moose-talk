package HappyCat;
use Test::More;
use Test::Routine;
use Cat;

has 'cat' => (
    is => 'rw',
    isa => 'Cat',
    lazy_build => 1
);

test 'Verify this is moggy' => sub{
    my $self = shift;
    my $cat = $self->cat;
    is( $cat->get_name, 'moggy', 'Correct cat' );
    ok( !$cat->is_grumpy, 'Moggy is not grumpy');
};

sub _build_cat {
    my $self = shift;
    return Cat->new( name => 'moggy' );
}
