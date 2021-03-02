#!
# $Id: run_with_cd_reporter.py.in 570628 2018-09-12 14:56:51Z ucko $
import os
import sys

cd_reporter = ''
if not os.path.exists(cd_reporter):
    os.execv(sys.argv[1], sys.argv[1:])

scriptdir   = os.path.join('/home/tiagotcc/tcc/programas/ncbi-blast-2.11.0+-src/c++', 'scripts')
# outdir      = os.path.join('/home/tiagotcc/tcc/programas/ncbi-blast-2.11.0+-src/c++/ReleaseMT', 'cd-reports')
status_dir  = '/home/tiagotcc/tcc/programas/ncbi-blast-2.11.0+-src/c++/ReleaseMT/status'
wanted      = frozenset(('name', 'type', 'contact', 'start_time', 'end_time',
                         'succeeded', 'build_type', 'source_directory',
                         'vcs_type', 'vcs_path', 'vcs_branch',
                         'artifact_name', 'artifact_version', 'artifact_hash',
                         'libs', 'command_line', 'tech_stack'))

cmake_ver = '@CMAKE_VERSION@'
## XXX - favor the real PyYAML installation accompanying cd_reporter?
sys.path.append(scriptdir + '/common/impl')
if cmake_ver and not cmake_ver.startswith('@'):
    from ncbicxx_build_info import CollectorCMake
else:
    from ncbicxx_build_info import Collector
# from yaml import dump
# try:
#     from yaml import CDumper as Dumper
# except ImportError:
#     from yaml import Dumper

pid = os.getpid()
if cmake_ver and not cmake_ver.startswith('@'):
    collector = CollectorCMake()
    collector.collect(sys.argv[1:], '@top_src_dir@', wanted, 0)
    pass
else:
    collector = Collector()
    collector.collect(sys.argv[1:], status_dir, wanted, 0)
args = [cd_reporter] # , '--dry-run', '-vvv'
for x in wanted:
    try:
        args.append('--%s=%s' % (x.replace('_', '-'),
                                 collector.get_as_string(x)))
    except KeyError:
        pass
os.execv(cd_reporter, args) # prints status code -- arrange to discard it?

# print('run_with_cd_reporter.py [%d]: Reporting on command %s'
#       % (pid, ' '.join(sys.argv)),
#       file = sys.stderr)
# out = open(('%s/%d.yaml') % (outdir, pid), 'w')
# dump(collector.info, out)
