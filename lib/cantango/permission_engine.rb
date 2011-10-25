module CanTango
  class PermissionEngine < Engine
    autoload_modules :Collector, :Compiler, :Evaluator, :Selector
    autoload_modules :Factory, :Loader, :Parser, :Permission
    autoload_modules :RulesParser, :Store, :YamlStore, :Statements, :Statement

    def initialize ability
      super
    end

    def execute!
      puts "Permission Engine executing..." if CanTango.config.debug.on?
      permissions.each do |permission|
        permission.evaluate! user
      end
    end

    def permissions
      permission_factory.build!
    end

    def permission_factory
      @permission_factory ||= CanTango::PermissionEngine::Factory.new ability
    end
  end
end
