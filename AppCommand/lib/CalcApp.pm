package CalcApp;
use v5.10;
use MooseX::App::Simple qw(Color);

parameter 'num1' => (
    is            => 'rw',
    isa           => 'Int',
    documentation => q[First number],
    required      => 1,
);

parameter 'num2' => (
    is            => 'rw',
    isa           => 'Int',
    documentation => q[Second number],
    required      => 1,
);

parameter 'operator' => (
    is            => 'rw',
    isa           => 'Str',
    documentation => q[operator],
    required      => 1,
);

option 'verbose' => (
    is => 'ro',
    isa => 'Bool',
    documentation => 'spew noise'
);

sub run {
  my $self = shift;
  my $statement =
     sprintf("%d %s %d", $self->num1, $self->operator, $self->num2);
  say $statement if $self->verbose;
  say eval $statement;
    
}
1;
