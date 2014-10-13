use Test::More;
use Test::Routine;
use Test::Routine::Util;
use Person;

has 'owner' => (
    is => 'rw',
    isa => 'Person',
    default => sub { Person->new( name => 'Fred' ) },
    clearer => 'clear',
);

before 'run_test' => sub {
       my $self = shift;
       $self->owner->set_cats([ $self->cat ]);
};

test 'When moggy is happy, fred is happy and vice-versa' => sub {
     my $self = shift;
     is( !$self->cat->is_grumpy, $self->owner->is_happy );
};

run_tests('Test with happy cats', ['main', 'HappyCat']);
run_tests('Test with grump cats', ['main', 'GrumpyCat']);
done_testing;

