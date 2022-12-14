#!/usr/bin/perl
use strict;
use warnings;
use Test::More tests => 216;

BEGIN { use_ok( 'Compass::Bearing' ); }

my $obj = Compass::Bearing->new;
isa_ok($obj, "Compass::Bearing");

is($obj->set, 3); #default
is($obj->set(1), 1);
my $a=-90;
my $b=45;
is($a, -90);
is($obj->bearing($a), "W");
is($obj->bearing($a+$b-0.1), "W");
is($obj->bearing($a+$b), "N");
is($obj->bearing($a+$b+0.1), "N");
$a+=90;
is($a, 0);
is($obj->bearing($a), "N");
is($obj->bearing_rad(0), "N");
is($obj->bearing($a+$b-0.1), "N");
is($obj->bearing($a+$b), "E");
is($obj->bearing($a+$b+0.1), "E");
$a+=90;
is($a, 90);
is($obj->bearing($a), "E");
is($obj->bearing_rad(2*atan2(1,1)), "E");
is($obj->bearing($a+$b-0.1), "E");
is($obj->bearing($a+$b), "S");
is($obj->bearing($a+$b+0.1), "S");
$a+=90;
is($a, 180);
is($obj->bearing($a), "S");
is($obj->bearing_rad(4*atan2(1,1)), "S");
is($obj->bearing($a+$b-0.1), "S");
is($obj->bearing($a+$b), "W");
is($obj->bearing($a+$b+0.1), "W");
$a+=90;
is($a, 270);
is($obj->bearing($a), "W");
is($obj->bearing_rad(6*atan2(1,1)), "W");
is($obj->bearing($a+$b-0.1), "W");
is($obj->bearing($a+$b), "N");
is($obj->bearing($a+$b+0.1), "N");
$a+=90;
is($a, 360);
is($obj->bearing($a), "N");
is($obj->bearing_rad(8*atan2(1,1)), "N");
is($obj->bearing($a+$b-0.1), "N");
is($obj->bearing($a+$b), "E");
is($obj->bearing($a+$b+0.1), "E");

is($obj->set(2), 2);
$a=-90;
$b=45/2;
is($a, -90);
is($obj->bearing($a), "W");
is($obj->bearing($a+$b-0.1), "W");
is($obj->bearing($a+$b), "NW");
is($obj->bearing($a+$b+0.1), "NW");
$a+=45;
is($a, -45);
is($obj->bearing($a), "NW");
is($obj->bearing($a+$b-0.1), "NW");
is($obj->bearing($a+$b), "N");
is($obj->bearing($a+$b+0.1), "N");
$a+=45;
is($a, 0);
is($obj->bearing($a), "N");
is($obj->bearing_rad(0), "N");
is($obj->bearing($a+$b-0.1), "N");
is($obj->bearing($a+$b), "NE");
is($obj->bearing($a+$b+0.1), "NE");
$a+=45;
is($a, 45);
is($obj->bearing($a), "NE");
is($obj->bearing($a+$b-0.1), "NE");
is($obj->bearing($a+$b), "E");
is($obj->bearing($a+$b+0.1), "E");
$a+=45;
is($a, 90);
is($obj->bearing($a), "E");
is($obj->bearing_rad(2*atan2(1,1)), "E");
is($obj->bearing($a+$b-0.1), "E");
is($obj->bearing($a+$b), "SE");
is($obj->bearing($a+$b+0.1), "SE");
$a+=45;
is($a, 135);
is($obj->bearing($a), "SE");
is($obj->bearing($a+$b-0.1), "SE");
is($obj->bearing($a+$b), "S");
is($obj->bearing($a+$b+0.1), "S");
$a+=45;
is($a, 180);
is($obj->bearing($a), "S");
is($obj->bearing_rad(4*atan2(1,1)), "S");
is($obj->bearing($a+$b-0.1), "S");
is($obj->bearing($a+$b), "SW");
is($obj->bearing($a+$b+0.1), "SW");
$a+=45;
is($a, 225);
is($obj->bearing($a), "SW");
is($obj->bearing($a+$b-0.1), "SW");
is($obj->bearing($a+$b), "W");
is($obj->bearing($a+$b+0.1), "W");
$a+=45;
is($a, 270);
is($obj->bearing($a), "W");
is($obj->bearing_rad(6*atan2(1,1)), "W");
is($obj->bearing($a+$b-0.1), "W");
is($obj->bearing($a+$b), "NW");
is($obj->bearing($a+$b+0.1), "NW");
$a+=45;
is($a, 315);
is($obj->bearing($a), "NW");
is($obj->bearing($a+$b-0.1), "NW");
is($obj->bearing($a+$b), "N");
is($obj->bearing($a+$b+0.1), "N");
$a+=45;
is($a, 360);
is($obj->bearing($a), "N");
is($obj->bearing_rad(8*atan2(1,1)), "N");
is($obj->bearing($a+$b-0.1), "N");
is($obj->bearing($a+$b), "NE");
is($obj->bearing($a+$b+0.1), "NE");

is($obj->set(3), 3);
$a=-90;
$b=45/4;
is($a, -90);
is($obj->bearing($a), "W");
is($obj->bearing($a+$b-0.1), "W");
is($obj->bearing($a+$b), "WNW");
is($obj->bearing($a+$b+0.1), "WNW");
$a+=$b*2;
is($a, -67.5);
is($obj->bearing($a), "WNW");
is($obj->bearing($a+$b-0.1), "WNW");
is($obj->bearing($a+$b), "NW");
is($obj->bearing($a+$b+0.1), "NW");
$a+=$b*2;
is($a, -45);
is($obj->bearing($a), "NW");
is($obj->bearing($a+$b-0.1), "NW");
is($obj->bearing($a+$b), "NNW");
is($obj->bearing($a+$b+0.1), "NNW");
$a+=$b*2;
is($a, -22.5);
is($obj->bearing($a), "NNW");
is($obj->bearing($a+$b-0.1), "NNW");
is($obj->bearing($a+$b), "N");
is($obj->bearing($a+$b+0.1), "N");
$a+=$b*2;
is($a, 0);
is($obj->bearing($a), "N");
is($obj->bearing_rad(0), "N");
is($obj->bearing($a+$b-0.1), "N");
is($obj->bearing($a+$b), "NNE");
is($obj->bearing($a+$b+0.1), "NNE");
$a+=$b*2;
is($a, 22.5);
is($obj->bearing($a), "NNE");
is($obj->bearing($a+$b-0.1), "NNE");
is($obj->bearing($a+$b), "NE");
is($obj->bearing($a+$b+0.1), "NE");
$a+=$b*2;
is($a, 45);
is($obj->bearing($a), "NE");
is($obj->bearing($a+$b-0.1), "NE");
is($obj->bearing($a+$b), "ENE");
is($obj->bearing($a+$b+0.1), "ENE");
$a+=$b*2;
is($a, 67.5);
is($obj->bearing($a), "ENE");
is($obj->bearing($a+$b-0.1), "ENE");
is($obj->bearing($a+$b), "E");
is($obj->bearing($a+$b+0.1), "E");
$a+=$b*2;
is($a, 90);
is($obj->bearing($a), "E");
is($obj->bearing_rad(2*atan2(1,1)), "E");
is($obj->bearing($a+$b-0.1), "E");
is($obj->bearing($a+$b), "ESE");
is($obj->bearing($a+$b+0.1), "ESE");
$a+=$b*2;
is($a, 112.5);
is($obj->bearing($a), "ESE");
is($obj->bearing($a+$b-0.1), "ESE");
is($obj->bearing($a+$b), "SE");
is($obj->bearing($a+$b+0.1), "SE");
$a+=$b*2;
is($a, 135);
is($obj->bearing($a), "SE");
is($obj->bearing($a+$b-0.1), "SE");
is($obj->bearing($a+$b), "SSE");
is($obj->bearing($a+$b+0.1), "SSE");
$a+=$b*2;
is($a, 157.5);
is($obj->bearing($a), "SSE");
is($obj->bearing($a+$b-0.1), "SSE");
is($obj->bearing($a+$b), "S");
is($obj->bearing($a+$b+0.1), "S");
$a+=$b*2;
is($a, 180);
is($obj->bearing($a), "S");
is($obj->bearing_rad(4*atan2(1,1)), "S");
is($obj->bearing($a+$b-0.1), "S");
is($obj->bearing($a+$b), "SSW");
is($obj->bearing($a+$b+0.1), "SSW");
$a+=$b*2;
is($a, 202.5);
is($obj->bearing($a), "SSW");
is($obj->bearing($a+$b-0.1), "SSW");
is($obj->bearing($a+$b), "SW");
is($obj->bearing($a+$b+0.1), "SW");
$a+=$b*2;
is($a, 225);
is($obj->bearing($a), "SW");
is($obj->bearing($a+$b-0.1), "SW");
is($obj->bearing($a+$b), "WSW");
is($obj->bearing($a+$b+0.1), "WSW");
$a+=$b*2;
is($a, 247.5);
is($obj->bearing($a), "WSW");
is($obj->bearing($a+$b-0.1), "WSW");
is($obj->bearing($a+$b), "W");
is($obj->bearing($a+$b+0.1), "W");
$a+=$b*2;
is($a, 270);
is($obj->bearing($a), "W");
is($obj->bearing_rad(6*atan2(1,1)), "W");
is($obj->bearing($a+$b-0.1), "W");
is($obj->bearing($a+$b), "WNW");
is($obj->bearing($a+$b+0.1), "WNW");
$a+=$b*2;
is($a, 292.5);
is($obj->bearing($a), "WNW");
is($obj->bearing($a+$b-0.1), "WNW");
is($obj->bearing($a+$b), "NW");
is($obj->bearing($a+$b+0.1), "NW");
$a+=$b*2;
is($a, 315);
is($obj->bearing($a), "NW");
is($obj->bearing($a+$b-0.1), "NW");
is($obj->bearing($a+$b), "NNW");
is($obj->bearing($a+$b+0.1), "NNW");
$a+=$b*2;
is($a, 337.5);
is($obj->bearing($a), "NNW");
is($obj->bearing($a+$b-0.1), "NNW");
is($obj->bearing($a+$b), "N");
is($obj->bearing($a+$b+0.1), "N");
$a+=$b*2;
is($a, 360);
is($obj->bearing($a), "N");
is($obj->bearing_rad(8*atan2(1,1)), "N");
is($obj->bearing($a+$b-0.1), "N");
is($obj->bearing($a+$b), "NNE");
is($obj->bearing($a+$b+0.1), "NNE");
$a+=$b*2;
is($a, 382.5);
is($obj->bearing($a), "NNE");
is($obj->bearing($a+$b-0.1), "NNE");
is($obj->bearing($a+$b), "NE");
is($obj->bearing($a+$b+0.1), "NE");
