desc "Remove temp files"
task :delete_swp do
  files = Dir['.*.swp']
  puts files.inspect
  rm(files, verbose: true) unless files.empty?
end
