package Person;
use strict;
use base qw(Class::Accessor);
Person->follow_best_practice;
Person->mk_accessors(qw(name age peers));
1;

