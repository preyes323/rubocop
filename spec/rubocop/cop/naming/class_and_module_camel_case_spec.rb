# frozen_string_literal: true

RSpec.describe RuboCop::Cop::Naming::ClassAndModuleCamelCase do
  subject(:cop) { described_class.new }

  it 'registers an offense for underscore in class and module name' do
    expect_offense(<<~RUBY)
      class My_Class
            ^^^^^^^^ Use CamelCase for classes and modules.
      end

      module My_Module
             ^^^^^^^^^ Use CamelCase for classes and modules.
      end
    RUBY
  end

  it 'is not fooled by qualified names' do
    expect_offense(<<~RUBY)
      class Top::My_Class
            ^^^^^^^^^^^^^ Use CamelCase for classes and modules.
      end

      module My_Module::Ala
             ^^^^^^^^^^^^^^ Use CamelCase for classes and modules.
      end
    RUBY
  end

  it 'accepts CamelCase names' do
    expect_no_offenses(<<~RUBY)
      class MyClass
      end

      module Mine
      end
    RUBY
  end
end
