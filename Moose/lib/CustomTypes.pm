package CustomTypes;

use MooseX::Types::Moose qw/Int/;
use MooseX::Types -declare => [ 'LifeEventDate' ];
use DateTime;

subtype LifeEventDate, as class_type 'DateTime';
coerce LifeEventDate, from Int, via { DateTime->from_epoch( epoch=> $_ ) };



1;

