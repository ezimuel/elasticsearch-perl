use lib 't/lib';

$ENV{ES_VERSION} = '0_90';
$ENV{ES_CXN}     = 'Mojo';
do "es_async_fork.pl" or die( $@ || $! );

