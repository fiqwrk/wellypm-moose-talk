use Test::More;
use HomoErectus;
use HomoHabilis;

my $erectus = HomoErectus->new;
my $habilis = HomoHabilis->new;

$erectus->hit_smart_ape( $erectus );
$habilis->hit_noisy_ape( $erectus );

is(110, $habilis->xp);
is(90, $erectus->xp);

done_testing;
