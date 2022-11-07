Name:           perl-Compass-Bearing
Version:        0.08
Release:        1%{?dist}
Summary:        Convert angle to text bearing (aka heading)
License:        MIT
Group:          Development/Libraries
URL:            http://search.cpan.org/dist/Compass-Bearing/
Source0:        http://www.cpan.org/modules/by-module/Compass/Compass-Bearing-%{version}.tar.gz
BuildRoot:      %{_tmppath}/%{name}-%{version}-%{release}-root-%(%{__id_u} -n)
BuildArch:      noarch
BuildRequires:  perl(ExtUtils::MakeMaker)
BuildRequires:  perl(GD::Graph::Polar) >= 0.09
BuildRequires:  perl(Geo::Functions) >= 0.03
BuildRequires:  perl(Package::New)
Requires:       perl(GD::Graph::Polar) >= 0.09
Requires:       perl(Geo::Functions) >= 0.03
Requires:       perl(Package::New)
Requires:       perl(:MODULE_COMPAT_%(eval "`%{__perl} -V:version`"; echo $version))

%description
Convert angle to text bearing (aka heading)

%prep
%setup -q -n Compass-Bearing-%{version}

%build
%{__perl} Makefile.PL INSTALLDIRS=vendor
make %{?_smp_mflags}

%install
rm -rf $RPM_BUILD_ROOT

make pure_install PERL_INSTALL_ROOT=$RPM_BUILD_ROOT

find $RPM_BUILD_ROOT -type f -name .packlist -exec rm -f {} \;
find $RPM_BUILD_ROOT -depth -type d -exec rmdir {} 2>/dev/null \;

%{_fixperms} $RPM_BUILD_ROOT/*

%check
make test

%clean
rm -rf $RPM_BUILD_ROOT

%files
%defattr(-,root,root,-)
%doc Changes LICENSE README.md
%{perl_vendorlib}/*
%{_mandir}/man3/*

%changelog
