package com.myweb.entity;

import java.io.Serializable;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name = "sys_permission")
public class Permission implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @OneToOne(targetEntity = Resource.class, cascade = CascadeType.REFRESH, fetch = FetchType.EAGER)
    @JoinColumn(name = "resource_id", referencedColumnName = "id")
    // @Fetch(FetchMode.SELECT)
    private Resource resource;

    @ManyToMany(targetEntity = Operation.class, cascade = CascadeType.REFRESH, fetch = FetchType.EAGER)
    @JoinTable(name = "sys_permission_operation", joinColumns = @JoinColumn(name = "permission_id", referencedColumnName = "id") , inverseJoinColumns = @JoinColumn(name = "operation_id", referencedColumnName = "id") )
    private Set<Operation> operations = new HashSet<>();

    private String name;

    private String description;

    public Permission() {
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    @Override
    public int hashCode() {
        final int prime = 31;
        int result = 1;
        result = prime * result + ((operations == null) ? 0 : operations.hashCode());
        result = prime * result + ((resource == null) ? 0 : resource.hashCode());
        return result;
    }

    @Override
    public boolean equals(Object obj) {
        if (this == obj)
            return true;
        if (obj == null)
            return false;
        if (getClass() != obj.getClass())
            return false;
        Permission other = (Permission) obj;
        if (operations == null) {
            if (other.operations != null)
                return false;
        } else if (!operations.equals(other.operations))
            return false;
        if (resource == null) {
            if (other.resource != null)
                return false;
        } else if (!resource.equals(other.resource))
            return false;
        return true;
    }

    public Resource getResource() {
        return resource;
    }

    public void setResource(Resource resource) {
        this.resource = resource;
    }

    public Set<Operation> getOperations() {
        return operations;
    }

    public void setOperations(Set<Operation> operations) {
        this.operations = operations;
    }

}
