# 1. List locally installed Python modules?
# ref. http://stackoverflow.com/questions/739993/how-can-i-get-a-list-of-locally-installed-python-modules
import pip
installed_packages = pip.get_installed_distributions()
installed_packages_list = sorted(["%s==%s" % (i.key, i.version)
     for i in installed_packages])
# sorted(["%s==%s" % (i.key, i.version) for i in pip.get_installed_distributions()])
print(installed_packages_list)

# 2. in Python shell/prompt
help('modules')

# 3. in shell
pip freeze
