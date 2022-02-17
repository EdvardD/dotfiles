import os
import ycm_core

script_dir = os.path.dirname(os.path.realpath(__file__))

flags = [
  '-Wall',
  '-Wextra',
  '-std=c++17',
  '-x',
  'c++',
  '-isystem', '/usr/include/c++/7.4.0',
  '-I',
  script_dir,
  '-I',
  script_dir + '/externals/include',
  '-I',
  script_dir + '/build/_deps/simdjson-src/include',
  ]

SOURCE_EXTENSIONS = [ '.cpp', '.cxx', '.cc', '.c', ]

def Settings( filename, **kwargs ):
  return {
  'flags': flags,
  'do_cache': True
  }
