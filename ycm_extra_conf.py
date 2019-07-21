import os
import ycm_core

flags = [
  '-Wall',
  '-Wextra',
  '-std=c++17',
  '-x',
  'c++',
  '-isystem', '/usr/include/c++/7.4.0',
  '-I',
  '.',
  ]

SOURCE_EXTENSIONS = [ '.cpp', '.cxx', '.cc', '.c', ]

def FlagsForFile( filename, **kwargs ):
  return {
  'flags': flags,
  'do_cache': True
  }
