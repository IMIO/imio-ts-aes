# -*- coding: utf-8 -*-
from django.core.exceptions import ObjectDoesNotExist
from django_rbac.utils import get_role_model, get_ou_model
from hobo.agent.authentic2.provisionning import provisionning


def create_roles():
    OU = get_ou_model()
    Role = get_role_model()
    organisation_unit = OU.objects.get(default=True)
    with provisionning:
        # create default role in ts2.
        try:
            role_agent_fabriques = Role.objects.get(name='Parent')
        except ObjectDoesNotExist:
            role_agent_fabriques = Role(name='Parent', ou=organisation_unit)
            role_agent_fabriques.save()
        try:
            role_agent_fabriques = Role.objects.get(name='Agents traitants - Portail parent')
        except ObjectDoesNotExist:
            role_agent_fabriques = Role(name='Agents traitants - Portail parent', ou=organisation_unit)
            role_agent_fabriques.save()


create_roles()
