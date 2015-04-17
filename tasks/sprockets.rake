namespace :assets do
  desc "Compile application assets"
  task :compile do
    Assets.precompile
  end
end

